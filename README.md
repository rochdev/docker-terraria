# docker-terraria

Terraria vanilla server with tModloader.

## Start the server

```sh
docker run -it --name=terraria \
  --restart="always" \
  -p 7777:7777 \
  -v "/path/to/modloader":/root/.local/share/Terraria/ModLoader \
  -v "/path/to/serverconfig.txt":/opt/terraria/Linux/serverconfig.txt \
  rochdev/terraria
```

## Attach to server console

```sh
docker attach terraria
```

## Detach from server console

```sh
crtl+p crtl+q
```
