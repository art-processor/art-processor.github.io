
    public Object viewedBuffer() {
        return viewedBuffer;
    }


    public ?@elmtType?Buffer slice() {
	int pos = this.position();
	int lim = this.limit();
	assert (pos <= lim);
	int rem = (pos <= lim \? lim - pos : 0);
	int off = (pos << ?@elmtSize?);
	return new Direct?@elmtType?Buffer?@ByteOrder?(this, -1, 0, rem, rem, off);
    }

    public ?@elmtType?Buffer duplicate() {
	return new Direct?@elmtType?Buffer?@ByteOrder?(this,
					      this.markValue(),
					      this.position(),
					      this.limit(),
					      this.capacity(),
					      0);
    }

    public ?@elmtType?Buffer asReadOnlyBuffer() {

	return new Direct?@elmtType?BufferR?@ByteOrder?(this,
					   this.markValue(),
					   this.position(),
					   this.limit(),
					   this.capacity(),
					   0);

    }

    public long address() {
	return address;
    }

    private long ix(int i) {
	return address + (i << ?@elmtSize?);
    }

#select ByteOrder
	#option ""|U
    public ?@elmttype? get() {
	return (unsafe.get?@elmtType?(ix(nextGetIndex())));
    }

    public ?@elmttype? get(int i) {
	return (unsafe.get?@elmtType?(ix(checkIndex(i))));
    }

    public ?@elmtType?Buffer put(?@elmttype? x) {

	unsafe.put?@elmtType?(ix(nextPutIndex()), (x));
	return this;

    }

    public ?@elmtType?Buffer put(int i, ?@elmttype? x) {

	unsafe.put?@elmtType?(ix(checkIndex(i)), (x));
	return this;

    }
	#endoption
	
	#option S
    public ?@elmttype? get() {
	return Bits.swap((unsafe.get?@elmtType?(ix(nextGetIndex()))));
    }

    public ?@elmttype? get(int i) {
	return Bits.swap((unsafe.get?@elmtType?(ix(checkIndex(i)))));
    }

    public ?@elmtType?Buffer put(?@elmttype? x) {

	unsafe.put?@elmtType?(ix(nextPutIndex()), Bits.swap(x));
	return this;

    }

    public ?@elmtType?Buffer put(int i, ?@elmttype? x) {

	unsafe.put?@elmtType?(ix(checkIndex(i)), Bits.swap(x));
	return this;

    }
	#endoption
#endselect

    public ?@elmtType?Buffer put(?@elmtType?Buffer src) {

	if (src instanceof Direct?@elmtType?Buffer?@ByteOrder?) {
	    if (src == this)
		throw new IllegalArgumentException();
	    Direct?@elmtType?Buffer?@ByteOrder? sb = (Direct?@elmtType?Buffer?@ByteOrder?)src;

	    int spos = sb.position();
	    int slim = sb.limit();
	    assert (spos <= slim);
	    int srem = (spos <= slim \? slim - spos : 0);

	    int pos = position();
	    int lim = limit();
	    assert (pos <= lim);
	    int rem = (pos <= lim \? lim - pos : 0);

	    if (srem > rem)
		throw new BufferOverflowException();
 	    unsafe.copyMemory(sb.ix(spos), ix(pos), srem << ?@elmtSize?);
 	    sb.position(spos + srem);
 	    position(pos + srem);
	} else {
	    super.put(src);
	}
	return this;

    }

    public ?@elmtType?Buffer compact() {

	int pos = position();
	int lim = limit();
	assert (pos <= lim);
	int rem = (pos <= lim \? lim - pos : 0);

 	unsafe.copyMemory(ix(pos), ix(0), rem << ?@elmtSize?);
 	position(rem);
	limit(capacity());
	return this;

    }

    public boolean isDirect() {
	return true;
    }

    public boolean isReadOnly() {
	return false;
    }
