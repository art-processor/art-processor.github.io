#output "BufferExample/output/"?@elmtType?"Buffer.java"
package ?@java_nio_packageName?;

public abstract class ?@elmtType?Buffer extends Buffer implements Comparable #break implements
{

#adapt "BufferExample/meta-fragments/[T]Buffer/commonAttributes.vcl"
#break moreAttributes

#adapt "BufferExample/meta-fragments/[T]Buffer/commonConstructors.vcl"
#break moreConstructors

#adapt "BufferExample/meta-fragments/[T]Buffer/commonMethods.vcl"
#break moreMethods

#break toString

}