function toggle_bluetooth_controller
    set config_file "/etc/bluetooth/main.conf"

    if test -f $config_file
        if grep -q "#ControllerMode = bredr" $config_file
            sed -i 's/#ControllerMode = bredr/ControllerMode = bredr/' $config_file
            echo "Modo Controller bredr activado"
        else
            sed -i 's/ControllerMode = bredr/#ControllerMode = bredr/' $config_file
            echo "Modo Controller bredr desactivado"
        end

        /etc/init.d/bluetooth restart
    else
        echo "El archivo de configuración $config_file no existe."
    end
end