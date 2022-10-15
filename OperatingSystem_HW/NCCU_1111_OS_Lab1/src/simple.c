#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <asm/param.h> // 定義了HZ
#include <linux/jiffies.h> // 裡裡面宣告了jiffies變數

// 當模組被載入會觸發這個函式 返回0代表成功 其他值代表失敗
static int simple_init(void)
{
    printk(KERN_INFO "Loading Module\n");
    
    //////////////////////
    ////<在此加入程式碼>////
    /////////////////////
    // printk(KERN_INFO "");  印出載入時的jiffies，使用％lu來表示，格式為"init_jiffies: XXXXXXXXXXX"，記得換行
    // printk(KERN_INFO "");  印出系統定義的的HZ，使用％d來表示，格式為"HZ: XXX"，記得換行
    printk(KERN_INFO "init_jiffies: %lu \n", jiffies);  // 印出載入時的jiffies，使用％lu來表示，格式為"init_jiffies: XXXXXXXXXXX"，記得換行
    printk(KERN_INFO "HZ: %d \n", HZ);  // 印出系統定義的的HZ，使用％d來表示，格式為"HZ: XXX"，記得換行
       return 0;
}

// 當模組被移除會觸發這個函式 無返回值
static void simple_exit(void) {
    
    //////////////////////
    ////<在此加入程式碼>////
    /////////////////////>
    //printk(KERN_INFO "");  印出移除時的jiffies，使用％lu來表示，格式為"exit_jiffies: XXXXXXXXXXX"，記得換行
    printk(KERN_INFO "exut_jiffies: %lu \n", jiffies);  // 印出移除時的jiffies，使用％lu來表示，格式為"exit_jiffies: XXXXXXXXXXX"，記得換行
	printk(KERN_INFO "Removing Module\n");
}

//這兩個巨集指令是註冊模組的入口與出口
module_init( simple_init );
module_exit( simple_exit );

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Simple Module");
MODULE_AUTHOR("NOBODY");

