#!/usr/bin/python2.7

# pinetd.py, lite telnet inetd for dgamelaunch
import os
import sys
import socket

def listen(addr, port):
    slisten = socket.socket()
    slisten.bind((addr, port))
    slisten.listen(10)

    while 1:
        conn, addr = slisten.accept()
        pid = os.fork()
        if pid != 0:
            continue  # Main thread loops to accept

        # Child thread
        os.dup2(conn.fileno(), 0)
        os.dup2(conn.fileno(), 1)
        os.dup2(conn.fileno(), 2)
        os.close(conn.fileno())
        os.close(slisten.fileno())
        runuser = "/usr/sbin/runuser"
        os.execl(runuser, runuser,
            "-l", "dglaunch", "-c",
            "/usr/sbin/in.telnetd -L /root/dgldir/dgamelaunch")

if __name__ == "__main__":
    listen('', 23)
