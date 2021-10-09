
import os
import time
import socket
import subprocess
import multiprocessing

st = time.time()


def get_ip():
    sock = socket.socket(type=socket.SOCK_DGRAM)
    try:
        sock.connect(('10.255.255.255', 1))
        ip = sock.getsockname()[0]
    except Exception as e:
        print(e)
        ip = '127.0.0.1'
    finally:
        sock.close()
    return ip


def ping(job_q, results_q):
    devnull = open(os.devnull, 'w')
    ip_check = job_q.get()
    if ip_check is None:
        return
    try:
        subprocess.check_call(['ping', '-c1', ip_check], stdout=devnull)
        results_q.put(ip_check)
    except subprocess.CalledProcessError:
        pass


pool_size = 254

jobs = multiprocessing.Queue()
results = multiprocessing.Queue()
pool = [multiprocessing.Process(target=ping, args=(jobs, results)) for i in range(pool_size)]

for process in pool:
    process.start()

ip_host = get_ip()
local_network_items = ip_host.split('.')[:-1]
local_network_str = '.'.join(local_network_items)

for i in range(1, pool_size+1):
    jobs.put('{}.{}'.format(local_network_str, i))

for process in pool:
    jobs.put(None)

for process in pool:
    process.join()

while not results.empty():
    ip_valid = results.get()
    print(ip_valid)

print(round(time.time() - st, 2))
