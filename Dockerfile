FROM node:14

# Configura el usuario "vscode" para evitar problemas de permisos
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Configura el usuario "vscode" como el usuario predeterminado
USER $USERNAME

# Establece el directorio de trabajo en la carpeta del código fuente
WORKDIR /app

# Instala las dependencias del proyecto
COPY package*.json ./
RUN npm install

# Copia el contenido actual del directorio al contenedor
COPY . .
