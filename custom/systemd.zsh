


function memoSystemd {
    echo
    echo "SYSTEMD MEMO"
    echo
    echo "  Service config dir: /etc/systemd/system"
    echo "  Main command:  systemctl"
    echo "    Common:      start|stop|restart|reload <myService>.service"
    echo "    Start auto:  enable|disable <myService>.service"
    echo "    Status:      status <myService>.service"
    echo "    List active: systemctl list-units --type=service"
    echo
    echo "  Echo service sample: cat /etc/systemd/system/toto.service:"
    echo "    [Unit]"
    echo "    Description=Hello World service"
    echo "    ConditionPathExists=/usr/bin/echo"
    echo "    [Service]"
    echo "    ExecStart=/usr/bin/echo HELLO WORLD"
    echo "    StandardOutput=tty"
    echo "    [Install]"
    echo "    WantedBy=multi-user.target       <= run level"
    echo "    ..."
    echo 
    
}
