
    public ByteOrder order() {
	#select ByteOrder
		#option S
	return ((ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN)
		\? ByteOrder.LITTLE_ENDIAN : ByteOrder.BIG_ENDIAN);
		#endoption
		#option U
	return ((ByteOrder.nativeOrder() != ByteOrder.BIG_ENDIAN)
		\? ByteOrder.LITTLE_ENDIAN : ByteOrder.BIG_ENDIAN);
		#endoption
	#endselect

    }
