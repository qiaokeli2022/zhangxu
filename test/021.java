public  class  ChangeChar{
	//编写一个main方法
	public  static  void main (String[] args){
//    \t :一个制表位，实现对齐功能
	System.out.println("北京\t天津\t上海");
//  \n:换行符
	System.out.println("jack\nsmith\nmary");
// \\:一个\
	System.out.println("hello\\hi");
// \" ：一个"
    System.out.println("我说：\"学习真快乐\"");
// \'：一个'
	System.out.println("我说：\'学习是真的快乐\'");
// \r  :一个回车 
	// 1.输出学习
	// 2.\r表示回车
	// 3.输出内容就是  北京真快乐  回车回到输出的第一个字符将学习换成北京
	System.out.println("学习真快乐\r北京");
	}
}