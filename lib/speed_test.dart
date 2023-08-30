import 'dart:async';
import 'dart:io';

void main() {
  final url = 'https://speed.hetzner.de/100MB.bin'; // 替换为您要下载的文件的 URL

  downloadFile(url).then((speed) {
    print('下载完成，平均下载速度: ${formatSpeed(speed)}');
  }).catchError((error) {
    print('下载出错: $error');
  });
}

Future<double> downloadFile(String url) async {
  final client = HttpClient();
  final startTime = DateTime.now().millisecondsSinceEpoch;
  int receivedBytes = 0;
  int totalBytes = 0;

  try {
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      totalBytes = response.contentLength;

      response.listen((List<int> data) {
        receivedBytes += data.length;
        final currentTime = DateTime.now().millisecondsSinceEpoch;
        final durationInSeconds = (currentTime - startTime) / 1000;
        final speed = receivedBytes / durationInSeconds;
        final progress = receivedBytes / totalBytes * 100;

        print('当前下载速度: ${formatSpeed(speed)}，下载进度: ${progress.toStringAsFixed(2)}%');
      });

      await response.drain();

      final endTime = DateTime.now().millisecondsSinceEpoch;
      final durationInSeconds = (endTime - startTime) / 1000;
      final speed = receivedBytes / durationInSeconds;

      return speed;
    } else {
      throw '下载出错，HTTP 状态码: ${response.statusCode}';
    }
  } finally {
    client.close();
  }
}

String formatSpeed(double speed) {
  if (speed < 1024) {
    return '${speed.toStringAsFixed(2)} bytes/second';
  } else if (speed < 1024 * 1024) {
    return '${(speed / 1024).toStringAsFixed(2)} KB/second';
  } else if (speed < 1024 * 1024 * 1024) {
    return '${(speed / (1024 * 1024)).toStringAsFixed(2)} MB/second';
  } else {
    return '${(speed / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB/second';
  }
}
