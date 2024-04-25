import tensorflow as tf

gpu_available = tf.test.is_gpu_available()
print(gpu_available)
