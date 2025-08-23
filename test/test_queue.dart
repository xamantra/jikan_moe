import 'dart:async';
import 'dart:collection';
import 'package:jikan_moe/src/jikan_client.dart';

/// Global queueing system for Jikan API requests that enforces rate limiting.
/// 
/// This class ensures that requests are sent at most once per second,
/// respecting Jikan's rate limit of 3 requests per second by being conservative.
class JikanRequestQueue {
  static final JikanRequestQueue _instance = JikanRequestQueue._internal();
  factory JikanRequestQueue() => _instance;
  JikanRequestQueue._internal();

  final Queue<_QueuedRequest> _requestQueue = Queue();
  bool _isProcessing = false;
  DateTime? _lastRequestTime;
  
  /// The minimum delay between requests (1 second)
  static const Duration _minDelay = Duration(seconds: 1);

  /// Enqueues a request and returns a Future that completes when the request is executed.
  /// 
  /// [requestFunction] should be the actual API call function that returns a Future.
  /// Returns a Future that completes with the result of the request function.
  Future<T> enqueue<T>(Future<T> Function() requestFunction) async {
    final completer = Completer<T>();
    final queuedRequest = _QueuedRequest(requestFunction, completer);
    
    _requestQueue.add(queuedRequest);
    _processQueue();
    
    return completer.future;
  }

  /// Processes the request queue, ensuring only one request is executed per second.
  void _processQueue() async {
    if (_isProcessing || _requestQueue.isEmpty) return;
    
    _isProcessing = true;
    
    while (_requestQueue.isNotEmpty) {
      // Check if enough time has passed since the last request
      if (_lastRequestTime != null) {
        final timeSinceLastRequest = DateTime.now().difference(_lastRequestTime!);
        if (timeSinceLastRequest < _minDelay) {
          final waitTime = _minDelay - timeSinceLastRequest;
          await Future.delayed(waitTime);
        }
      }
      
      // Execute the next request
      final queuedRequest = _requestQueue.removeFirst();
      _lastRequestTime = DateTime.now();
      
      try {
        final result = await queuedRequest.requestFunction();
        queuedRequest.completer.complete(result);
      } catch (error) {
        queuedRequest.completer.completeError(error);
      }
    }
    
    _isProcessing = false;
  }

  /// Clears all pending requests in the queue.
  void clear() {
    while (_requestQueue.isNotEmpty) {
      final queuedRequest = _requestQueue.removeFirst();
      queuedRequest.completer.completeError(
        StateError('Request cancelled - queue was cleared')
      );
    }
  }

  /// Gets the current number of pending requests in the queue.
  int get pendingCount => _requestQueue.length;

  /// Checks if the queue is currently processing requests.
  bool get isProcessing => _isProcessing;
}

/// Internal class to represent a queued request.
class _QueuedRequest {
  final Future Function() requestFunction;
  final Completer completer;
  
  _QueuedRequest(this.requestFunction, this.completer);
}

/// Extension on JikanClient to add queueing capabilities.
extension JikanClientQueueExtension on JikanClient {
  /// Executes a request through the global queue with rate limiting.
  /// 
  /// [requestFunction] should be a function that calls a Jikan API method.
  /// Returns a Future that completes with the result of the request.
  Future<T> queuedRequest<T>(Future<T> Function() requestFunction) {
    return JikanRequestQueue().enqueue(requestFunction);
  }
}

/// Global instance for easy access in tests.
final jikanQueue = JikanRequestQueue();
