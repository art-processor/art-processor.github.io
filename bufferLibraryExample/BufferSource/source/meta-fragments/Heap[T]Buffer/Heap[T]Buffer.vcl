#output "BufferExample/output/Heap"?@elmtType?"Buffer.java"

/*
 * @Heap-X-Buffer.java	1.24 01/12/03
 *
 * Copyright 2002 Sun Microsystems, Inc. All rights reserved.
 * SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

// -- This file was mechanically generated: Do not edit! -- //

package java.nio;

/**

 * A read/write Heap?@elmtType?Buffer.

 */

class Heap?@elmtType?Buffer
    extends ?@elmtType?Buffer
{

    // For speed these fields are actually declared in X-Buffer;
    // these declarations are here as documentation
    /*

    protected final byte[] hb;
    protected final int offset;

    */

#adapt "BufferExample/meta-fragments/Heap[T]Buffer/commonConstructors.vcl"
#adapt "BufferExample/meta-fragments/Heap[T]Buffer/commonMethods.vcl"

#break moreMethods

}
