
    public ?@elmtType?Buffer slice() {
	int pos = this.position();
	int lim = this.limit();
	assert (pos <= lim);
	int rem = (pos <= lim \? lim - pos : 0);
	int off = (pos << ?@elmtSize?) + offset;
	return new ByteBufferAs?@elmtType?BufferR?@ByteOrder?(bb, -1, 0, rem, rem, off);
    }

    public ?@elmtType?Buffer duplicate() {
	return new ByteBufferAs?@elmtType?BufferR?@ByteOrder?(bb,
						    this.markValue(),
						    this.position(),
						    this.limit(),
						    this.capacity(),
						    offset);
    }

    public ?@elmtType?Buffer asReadOnlyBuffer() {

	return duplicate();

    }

    public ?@elmtType?Buffer put(?@elmttype? x) {

	throw new ReadOnlyBufferException();

    }

    public ?@elmtType?Buffer put(int i, ?@elmttype? x) {

	throw new ReadOnlyBufferException();

    }

    public ?@elmtType?Buffer compact() {

	throw new ReadOnlyBufferException();

    }

    public boolean isDirect() {
	return bb.isDirect();
    }

    public boolean isReadOnly() {
	return true;
    }

    public ByteOrder order() {

	#select ByteOrder
		#option B
	return ByteOrder.BIG_ENDIAN;
		#endoption
		#option L
	return ByteOrder.LITTLE_ENDIAN;
		#endoption
	#endselect
    }
