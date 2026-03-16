#!/bin/bash
set -e

echo "Sync des dépendances avec uv..."
uv sync

echo "Vérification du kernel Jupyter..."
KERNEL_NAME="projet-ml"
KERNEL_DIR="$HOME/.local/share/jupyter/kernels/$KERNEL_NAME"

if [ ! -d "$KERNEL_DIR" ]; then
    echo "Création du kernel Jupyter $KERNEL_NAME..."
    uv run pip install ipykernel
    uv run python -m ipykernel install --user --name $KERNEL_NAME --display-name "Python ($KERNEL_NAME)"
else
    echo "Kernel $KERNEL_NAME déjà présent, rien à faire."
fi

echo "Installation terminée ✅"