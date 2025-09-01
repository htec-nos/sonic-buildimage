from http.server import BaseHTTPRequestHandler, HTTPServer

class DummyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from dummy SONiC service!\n")

def main():
    server = HTTPServer(("0.0.0.0", 8080), DummyHandler)
    print("Dummy service running on port 8080...")
    server.serve_forever()
