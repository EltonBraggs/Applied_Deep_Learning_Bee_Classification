	ȕz��j@ȕz��j@!ȕz��j@	m���,F�?m���,F�?!m���,F�?"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$ȕz��j@g�W�B�?A����j@Y�g��?*	'1�@��@2g
0Iterator::Model::Prefetch::FlatMap[0]::Generator�p!qG@!�>V�X@)�p!qG@1�>V�X@:Preprocessing2F
Iterator::Model�o�N\��?!��$:�?)7¢"N'y?1]�z8ъ?:Preprocessing2P
Iterator::Model::Prefetch;�zj�u?!�g�;i�?);�zj�u?1�g�;i�?:Preprocessing2Y
"Iterator::Model::Prefetch::FlatMap-$`tyqG@!o�],n�X@)N�E� f?1�O"�uw?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
device�Your program is NOT input-bound because only 0.0% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.no*no#You may skip the rest of this page.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	g�W�B�?g�W�B�?!g�W�B�?      ��!       "      ��!       *      ��!       2	����j@����j@!����j@:      ��!       B      ��!       J	�g��?�g��?!�g��?R      ��!       Z	�g��?�g��?!�g��?JCPU_ONLY