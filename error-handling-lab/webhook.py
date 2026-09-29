from http.server import BaseHTTPRequestHandler, HTTPServer

class WebhookHandler(BaseHTTPRequestHandler):

    def do_POST(self):
        length = int(self.headers.get("Content-Length", 0))
        data = self.rfile.read(length)

        print("Webhook received:")
        print(data.decode())

        self.send_response(200)
        self.end_headers()

server = HTTPServer(("127.0.0.1", 8000), WebhookHandler)

print("Webhook listening on port 8000...")

server.serve_forever()