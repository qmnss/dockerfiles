NGINX RTMP Dockerfile
=====================

This Dockerfile installs NGINX configured with `nginx-rtmp-module`, ffmpeg,
and a (probably) non-working jwplayer instance.


How to use
-----------

1. Build and run the container (`docker build -t nginx_rtmp .` &
   `docker run -p 1935:1935 -p 8080:80 --rm nginx_rtmp`).

2. Stream your live content to `rtmp://localhost:1935/encoder/stream_name` where
   `stream_name` is the name of your stream.

3. If you're this far, figure out what to do with player.html.

Links
-----

* http://nginx.org/
* https://github.com/arut/nginx-rtmp-module
* https://www.ffmpeg.org/
* https://obsproject.com/
