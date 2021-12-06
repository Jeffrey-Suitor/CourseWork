#include <linux/module.h>       /* Needed by all modules */
#include <linux/kernel.h>       /* Needed for KERN_INFO */
#include <linux/init.h>         /* Needed for the macros */

#define DRIVER_AUTHOR "Jeff Suitor & Justin Palombo"
#define DRIVER_DESC "Lab 2 Hello Module 3"

static int hello_3_data __initdata = 3;

static int __init hello_3_init(void) {
        printk(KERN_INFO "Hello dummy world number %d\n", hello_3_data);
        return 0;
}

static void __exit hello_3_exit(void) {
        printk(KERN_INFO "Goodbye cruel world %d\n", hello_3_data);
}

module_init(hello_3_init);
module_exit(hello_3_exit);

MODULE_AUTHOR(DRIVER_AUTHOR);
MODULE_DESCRIPTION(DRIVER_DESC);
MODULE_LICENSE("GPL");
