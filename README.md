# cloudinit

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' f4102cbe6968