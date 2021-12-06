#include <linux/module.h>       /* Needed by all modules */
#include <linux/kernel.h>       /* Needed for KERN_INFO */
#include <linux/init.h>         /* Needed for the macros */

#define DRIVER_AUTHOR "Jeff Suitor & Justin Palombo"
#define DRIVER_DESC "Lab 2 Hello Module 4"

static char *my_string = "dummy";
module_param(my_string, charp, 0000);
MODULE_PARM_DESC(my_string, "A character string");


static int my_int = 0;
module_param(my_int, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
MODULE_PARM_DESC(my_int, "An int");

static int hello_4_data __initdata = 4;

static int __init hello_4_init(void) {
        printk(KERN_INFO "My int: %d\n", my_int);
        printk(KERN_INFO "My string: %s\n", my_string);
        printk(KERN_INFO "Hello dummy world number %d\n", hello_4_data);
        return 0;
}

static void __exit hello_4_exit(void) {
        printk(KERN_INFO "Goodbye cruel world %d\n", hello_4_data);
}

module_init(hello_4_init);
module_exit(hello_4_exit);

MODULE_AUTHOR(DRIVER_AUTHOR);
MODULE_DESCRIPTION(DRIVER_DESC);
MODULE_LICENSE("GPL");
