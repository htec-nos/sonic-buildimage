from http.server import BaseHTTPRequestHandler, HTTPServer
from syslog import syslog, LOG_INFO

class DummyHandler(BaseHTTPRequestHandler):
    num_get_requests = 0
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from dummy SONiC service!\n")
        DummyHandler.num_get_requests += 1
        syslog(LOG_INFO, f"Hello syslog! Handled GET request number {DummyHandler.num_get_requests}")
        print("Hello stdout! This comes from a normal python print statement.")

def main():
    server = HTTPServer(("0.0.0.0", 8080), DummyHandler)
    print("Dummy service running on port 8080...")
    server.serve_forever()
