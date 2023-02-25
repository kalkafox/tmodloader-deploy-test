FROM archlinux:base-devel
RUN pacman -Syu --noconfirm

# Install dotnet core
RUN pacman -S --noconfirm unzip

WORKDIR /root

# Get tModLoader
RUN curl -L -o tModLoader.zip https://github.com/tModLoader/tModLoader/releases/download/v2022.09.47.33/tModLoader.zip
RUN unzip tModLoader.zip
RUN rm tModLoader.zip

# Make ./start-tModLoaderServer.sh executable
RUN chmod +x ./start-tModLoaderServer.sh

# Make volume for tModLoader (ModConfigs, Mods, Players, Worlds)
VOLUME /root/.local/share/Terraria/tModLoader/ModConfigs
VOLUME /root/.local/share/Terraria/tModLoader/Mods
VOLUME /root/.local/share/Terraria/tModLoader/Players
VOLUME /root/.local/share/Terraria/tModLoader/Worlds


WORKDIR /root/.local/share/Terraria/tModLoader



# Run tModLoader
ENTRYPOINT [ "/root/start-tModLoaderServer.sh" ]