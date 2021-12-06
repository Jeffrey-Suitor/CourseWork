#include <linux/module.h>       /* Needed by all modules */
#include <linux/kernel.h>       /* Needed for KERN_INFO */
#include <linux/init.h>         /* Needed for the macros */

static int hello_2_data __initdata = 2;

static int __init hello_2_init(void) {
        printk(KERN_INFO "Hello dummy world number %d\n", hello_2_data);
        return 0;
}

static void __exit hello_2_exit(void) {
        printk(KERN_INFO "Goodbye cruel world %d\n", 2);
}

module_init(hello_2_init);
module_exit(hello_2_exit);
