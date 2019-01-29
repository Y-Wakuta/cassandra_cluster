import sys

args = sys.argv
cluster_num = int(args[1])

print [str(((2**64 / cluster_num) * i) - 2**63) for i in range(cluster_num)]
