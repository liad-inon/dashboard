import threading
import time
from networktables import NetworkTables
import json
from flask import Flask
from flask_sock import Sock

app = Flask(__name__)
sock = Sock(app)

connection_status_robot = 'not connected'
nt_data = {}
value_was_updated = True

def connect_to_robot() -> None:
    global connection_status_robot

    cond = threading.Condition()

    notified = [False]

    def connectionListener(connected, info):
        print(info, '; Connected=%s' % connected)
        with cond:
            notified[0] = True
            cond.notify()

    NetworkTables.initialize(server='localhost')
    NetworkTables.addConnectionListener(connectionListener, immediateNotify=True)

    with cond:
        if not notified[0]:
            cond.wait()


def robot_updates_listener(key:str, value, isNew):
    global nt_data, value_was_updated
    nt_data[key] = value
    value_was_updated = True

@app.route('/')
def index():
    return "Data not found", 400

@app.route('/networktable/connection-status')
def nt_connection_status():
    global connection_status_robot
    return connection_status_robot

@sock.route('/networktables')
def handle_nt(ws):
    global value_was_updated
    while True:
        if value_was_updated:
            ws.send(json.dumps(nt_data))
            value_was_updated = False
        

    


if __name__ == '__main__':
    threading.Thread(target=lambda: app.run()).start()

    connect_to_robot()

    NetworkTables.addEntryListener(robot_updates_listener)

    while True:
        connection_status_robot = "connected" if NetworkTables.isConnected() else 'not connected'
        time.sleep(0.1)
  