# ansible 安装
![](https://k8s-1252881505.cos.ap-beijing.myqcloud.com/k8s-2/ansible.png)
- `Inventory`：Ansible管理的主机信息，包括IP地址、SSH端口、账号、密码等
- `Modules`：任务均有模块完成，也可以自定义模块，例如经常用的脚本。
- `Plugins`：使用插件增加Ansible核心功能，自身提供了很多插件，也可以自定义插件。例如`connection`插件，用于连接目标主机。
- `Playbooks`：“剧本”，模块化定义一系列任务，供外部统一调用。Ansible核心功能。

## 主机清单
hosts  
>sed -i "s/#host_key_checking = .*/host_key_checking = False/g" /etc/ansible/ansible.cfg
## 命令行
| 选项                                  | 描述                     |
| ------------------------------------- | ------------------------ |
| -C, --check                           | 运行检查，不执行任何操作 |
| -e EXTRA_VARS,--extra-vars=EXTRA_VARS | 设置附加变量 key=value   |
| -u REMOTE_USER, --user=REMOTE_USER    | SSH连接用户，默认None    |
| -k, --ask-pass                        | SSH连接用户密码          |
| -b, --become                          | 提权，默认root           |
| -K, --ask-become-pass                 | 提权密码                 |

## playbooks
