#
# This file is called by /etc/init.d/vdr
#

writewarning ()
{
echo -e \
"#\n"\
"# This file is automatically generated by the vdr init-script. You can\n"\
"# define custom commands in /etc/vdr/command-hooks/$1.custom.conf\n"\
"# (see /usr/share/doc/vdr/README.Debian.gz).\n"\
"#\n\n\n"
}

# merges single <cmdtype>.<name>.conf files into one <cmdtype>.conf using
# the order defined in order.<cmdtype>.conf
mergecommands ()
{
    local cmd
    local cmds
    local cmdsorder
    local line
    local cmdtype
    local cmdfile
    local ordered_cmds

    cmdtype=$1
    cmdfile="/var/cache/vdr/$cmdtype.conf"

    writewarning $cmdtype > "$cmdfile"

    cmdsorder=( `cat /etc/vdr/command-hooks/order.$cmdtype.conf | sed "s/#.*$//"` )
    cmds=( `find $CMDHOOKSDIR -maxdepth 1 -name "$cmdtype.*.conf" -printf "%f \n" | sed "s/$cmdtype\.\(.\+\)\.conf/\1/g"` )

    # first the ordered commands:
    for cmd in ${cmdsorder[@]}; do
        for (( line=0 ; line<${#cmds[@]} ; line++ )); do
            if [ "$cmd" = "-${cmds[$line]}" ]; then
                unset cmds[$line]
                cmds=( "${cmds[@]}" )
                break
            fi
            if [ "$cmd" = "${cmds[$line]}" ]; then
                ordered_cmds=( "${ordered_cmds[@]}" "${cmds[$line]}" )
                unset cmds[$line]
                cmds=( "${cmds[@]}" )
                break
            fi
        done
    done
    # then the remaining unordered commands:
    ordered_cmds=( "${ordered_cmds[@]}" "${cmds[@]}" )

    # concatenate all commands
    for cmd in ${ordered_cmds[@]}; do
        if [ "$cmd" != "" ]; then
            cat "$CMDHOOKSDIR/$cmdtype.$cmd.conf" >> "$cmdfile" || true
            echo "" >> "$cmdfile"
        fi
    done
}
