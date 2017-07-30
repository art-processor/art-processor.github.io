#output "BufferExample/output/Direct"?@elmtType?"BufferR"?@ByteOrder?".java"

/*
 * @Direct-X-Buffer.java	1.37 01/12/03
 *
 * Copyright 2002 Sun Microsystems, Inc. All rights reserved.
 * SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

// -- This file was mechanically generated: Do not edit! -- //

package ?@java_nio_packageName?;

import sun.misc.Unsafe;
import sun.nio.ch.DirectBuffer;
import sun.nio.ch.FileChannelImpl;

class Direct?@elmtType?BufferR?@ByteOrder?

    extends Direct?@elmtType?Buffer?@ByteOrder?

    implements DirectBuffer
{

#adapt "BufferExample/meta-fragments/Direct[T]BufferR[SU]/commonConstructors.vcl"
#break moreConstructors
#adapt "BufferExample/meta-fragments/Direct[T]BufferR[SU]/commonMethods.vcl"
#break moreMethods

}
