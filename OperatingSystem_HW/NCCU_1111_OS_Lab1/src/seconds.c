#include <linux/version.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/proc_fs.h>
#include <linux/uaccess.h>
#include <asm/uaccess.h>
#include <linux/jiffies.h> // 裡裡面宣告了jiffies變數


#define BUFFER_SIZE 128

#define PROC_NAME "seconds"
unsigned long init_jiffies,total_elapsed_time; //可以用這裡的變數

/**
 * Function prototypes
 */
static ssize_t proc_read(struct file *file, char *buf, size_t count, loff_t *pos);

#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0)
#define HAVE_PROC_OPS
#endif


//而關於這個 proc 檔案的設定，則定義在 proc_ops 這個 file_operations 資料結構裡。
#ifdef HAVE_PROC_OPS
static struct proc_ops proc_ops = {
        .proc_read = proc_read,
};
#else
static struct file_operations proc_ops = {
        .owner = THIS_MODULE,
        .read = proc_read,
};
#endif


// 當模組被載入會觸發這個函式 返回0代表成功 其他值代表失敗
static int proc_init(void)
{
    
    //////////////////////
    ////<在此加入程式碼>////
    /////////////////////
    //用變數記住載入模組時的jiffies
    init_jiffies = jiffies;
    
    // 創出/proc/seconds這個項目
    proc_create(PROC_NAME, 0, NULL, &proc_ops);

    printk(KERN_INFO "/proc/%s created\n", PROC_NAME);

	return 0;
}

// 當模組被移除會觸發這個函式 無返回值
static void proc_exit(void) {
    
        // 移除/proc/seconds項目
        remove_proc_entry(PROC_NAME, NULL);

        printk( KERN_INFO "/proc/%s removed\n", PROC_NAME);
}

//每次/proc/seconds檔案被讀取就會呼叫 proc_read
// ssize_t是資料型別，在32位機器上等同與int，在64位機器上等同與long int
static ssize_t proc_read(struct file *file, char __user *usr_buf, size_t count, loff_t *pos)
{
        int rv = 0; // 顯示訊息的長度
        char buffer[BUFFER_SIZE];
    
        // 每次讀取 /proc/seconds 檔案時，會重複呼叫proc_read()函式，所以下面的程式碼是為了
        // 限制在 "cat /proc/seconds" 時，只會列出一次資訊，否則只要回傳的不是0就會一直循環輸出下去
        static int completed = 0;
        if (completed) {
                completed = 0;
                return 0;
        }
        completed = 1;

        // 計算目前jiffies和模組初始jiffies的差，並除以HZ值
        total_elapsed_time = ((jiffies - init_jiffies) / HZ);
        // 將結果透過sprintf放到buffer中，使用%ld印出
        rv = sprintf(buffer,
                     "Module has been running for %ld seconds\n",
                     //////////////////////
                     ////<在此加入程式碼>////
                     /////////////////////
                     total_elapsed_time
                     );

    
        // 將buffer的內容複製到用戶空間usr_buf
        raw_copy_to_user(usr_buf, buffer, rv);

        return rv;
}


//這兩個巨集指令是註冊模組的入口與出口
module_init( proc_init );
module_exit( proc_exit );

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Seconds Module");
MODULE_AUTHOR("NOBODY");
