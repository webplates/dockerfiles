import itertools
from jinja2 import Environment, FileSystemLoader
import os
import shutil
from helper import *

DIST = "dist"
REPO = "webplates/beanstalkd"

VERSIONS = ["1.10"]
DISTROS = ["alpine"]

MATRIX = set(itertools.chain(
    itertools.product(VERSIONS, DISTROS),
    itertools.product(VERSIONS, [None])
))

# Prepare Jinja
env = Environment(loader=FileSystemLoader(os.path.dirname(os.path.realpath(__file__))))

# Clear the dist folder
if os.path.isdir(DIST):
    shutil.rmtree(DIST, ignore_errors=True)
os.mkdir(DIST)

# Initialize state variables
paths = []
tags = []

for image in MATRIX:
    # Initialize template
    template = env.get_template(matrix_join(("Dockerfile", image[1]), "-") + ".template")

    path = DIST + "/" + matrix_join(image, "/")
    os.makedirs(path, exist_ok=True)
    dockerfile = path + "/Dockerfile"
    template.stream(version=image[0]).dump(dockerfile)
    shutil.copy("entrypoint.sh", path)
    paths.append(path)
    tags.append(set(get_tags(image)))

with open(".auth", "r") as f:
    token = f.readline().rstrip()

delete_builds(REPO, token)
add_builds(REPO, token, paths, tags)

FORMAT = "%-35s %s"
print (FORMAT % ("PATH", "TAG"))

for c1, c2 in zip(paths, tags):
    for tag in c2:
        print ("%-35s %s" % (c1, tag))
