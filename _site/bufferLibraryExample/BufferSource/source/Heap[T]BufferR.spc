#set java_nio_packageName = "java.nio"

#set elmtType = "Byte","Char","Double","Float","Int","Long","Short"
#set elmttype = "byte","char","double","float","int","long","short"
#set elmtSize = 0,1,3,2,2,3,1

#while elmtType, elmttype, elmtSize
	#adapt: "BufferExample/meta-fragments/Heap[T]BufferR/Heap[T]BufferR.vcl"
		#select elmtType
			#option Byte
				#insert-after moreMethods
					#adapt "BufferExample/meta-fragments/Heap[T]BufferR/HeapByteBufferR_moreMethods.vcl"
				#endinsert
			#endoption
			#option Char
				#insert-after moreMethods
					#adapt "BufferExample/meta-fragments/Heap[T]BufferR/order.vcl"
					#adapt "BufferExample/meta-fragments/Heap[T]BufferR/HeapCharBufferR_moreMethods.vcl"
				#endinsert
			#endoption
			#otherwise
					#insert-after moreMethods
						#adapt "BufferExample/meta-fragments/Heap[T]BufferR/order.vcl"
					#endinsert
			#endotherwise
		#endselect
	#endadapt
#endwhile