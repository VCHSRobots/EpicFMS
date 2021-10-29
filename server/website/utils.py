# utils.py -- general utilities for fms server code
# dlb, Oct 2021

def ip_addr_okay(ip):
    # IP address should be in the form of xx.xx.xx.xx with
    # no spaces
    if ip is None: return False
    if len(ip) < 6: return False
    for c in ip:
        if c == " " or c == "\t": return False
    nums = ip.split(".")
    if len(nums) != 4: return False 
    for n in nums:
        if not n.isdecimal(): return False 
        i = int(n) 
        if i < 0 or i > 255: return False 
    return True

def make_bool(arg):
    if type(arg) is bool: return arg
    if type(arg) is int:
        if arg == 0: return False
        else: return True
    if type(arg) is str:
        if arg.lower() == "y" or arg.lower() == "yes": return True
        if arg.lower() == "t" or arg.lower() == "true": return True
        return False 
    if type(arg) is float:
        if arg == 0.0: return False
        return True
    return False
