#set java_nio_packageName = "java.nio"

#set elmtType = "Byte","Char","Double","Float","Int","Long","Short"
#set elmttype = "byte","char","double","float","int","long","short"
#set elmtSize = 0,1,3,2,2,3,1

#while elmtType, elmttype, elmtSize
	#adapt: "BufferExample/meta-fragments/Heap[T]Buffer/Heap[T]Buffer.vcl"
		#insert-after moreMethods
			#select elmtType
				#option Byte|Char
					#adapt "BufferExample/meta-fragments/Heap[T]Buffer/Heap"?@elmtType?"Buffer_moreMethods.vcl"
				#endoption
				#option Char|Double|Float|Int|Long|Short
					#adapt "BufferExample/meta-fragments/Heap[T]Buffer/order.vcl"
				#endoption
			#endselect
		#endinsert
	#endadapt
#endwhile
