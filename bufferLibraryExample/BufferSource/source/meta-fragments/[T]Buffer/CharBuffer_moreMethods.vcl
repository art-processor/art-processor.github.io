	/**
     * Wraps a character sequence into a buffer.
     *
     */
    public static CharBuffer wrap(CharSequence csq, int start, int end) {
	try {
	    return new StringCharBuffer(csq, start, end);
	} catch (IllegalArgumentException x) {
	    throw new IndexOutOfBoundsException();
	}
    }

    /**
     * Wraps a string into a buffer.
     * 
     */
    public static CharBuffer wrap(CharSequence csq) {
	return wrap(csq, 0, csq.length());
    }

    /**
     * Relative bulk<i>put</i> method&nbsp;&nbsp;<i>(optional operation)</i>.
     */
    public CharBuffer put(String src, int start, int end) {
	checkBounds(start, end - start, src.length());
	for (int i = start; i< end; i++)
	    this.put(src.charAt(i));
	return this;
    }

    /**
     * Relative bulk<i>put</i> method&nbsp;&nbsp;<i>(optional operation)</i>.
     *
     */
    public final CharBuffer put(String src) {
	return put(src, 0, src.length());
    }


    /**
     * Returns a string containing the characters in this buffer.
     *
     *<p> The first character of the resulting string will be the character at
     * this buffer's position, while the last character will be the character
     * at index<tt>limit()</tt>&nbsp;-&nbsp;1.  Invoking this method does not
     * change the buffer's position.</p>
     *
     * @return  The specified string
     */
    public String toString() {
	return toString(position(), limit());
    }

    abstract String toString(int start, int end);	// package-private



    /**
     * Returns the length of this character buffer.
     */
    public final int length() {
	return remaining();
    }

    /**
     * Reads the character at the given index relative to the current
     * position.</p>
     *
     */
    public final char charAt(int index) {
        return get(position() + checkIndex(index, 1));
    }

    /**
     * Creates a new character buffer that represents the specified subsequence
     * of this buffer, relative to the current position.
     *
     */
    public abstract CharSequence subSequence(int start, int end);
