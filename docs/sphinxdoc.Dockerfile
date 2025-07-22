# Description: Dockerfile for building sphinx documentation
FROM sphinxdoc/sphinx

# Extend the sphinx image with the rtd theme
RUN python3 -m pip install sphinx-rtd-theme

# Copy your documentation source files into the image
COPY docs/source /docs/source
COPY docs/Makefile /docs

# Set the working directory to /docs
WORKDIR /docs

# Build the Sphinx documentation when the container runs
CMD ["make", "html"]


## BUILD ##

# Build an image with this command. Make sure you cd to the root of the project before running this command
# 	docker build -f doc/sphinxdoc.Dockerfile -t sphinx_builder:v1 .


## RUN ##

# To re-build the html, it is advisable to remove the entire build directory.
# Make sure you cd to the root of the project before running this command and confirm the path before running this command!
#   rm -rf doc/_build

# Run image with this command. Make sure you cd to the root of the project before running this command
# 	docker run --rm -v $(pwd)/doc:/docs -v $(pwd)/doc/build/html:/docs/build/html sphinx_builder:v1

# TODO: Test this on a different machine please

