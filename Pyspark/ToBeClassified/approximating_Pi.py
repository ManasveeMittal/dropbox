from pyspark import SparkContext as sc
import random

num_samples = 100000
m=list(range(0, num_samples))
def inside(p):
  x, y = random.random(), random.random()
  return x*x + y*y < 1

count = sc.parallelize(m,4).filter(inside).count()
pi = 4 * count / num_samples
print(pi)
sc.stop()