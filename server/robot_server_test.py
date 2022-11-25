import time
from networktables import NetworkTables

NetworkTables.initialize()
sd = NetworkTables.getTable("SmartDashboard")

i = 0
sd.putNumber("robotTime", 11)
sd.putNumber("sss", 15)
while True:
    print(i)
    time.sleep(1)
    i += 1
    sd.getSubTable('test').putValue('test', i)