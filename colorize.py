import os

source_image = os.environ.get('COLORIZE_SOURCE_IMAGE')
target_path = os.environ.get('COLORIZE_TARGET_PATH')
render_factor = os.environ.get('COLORIZE_RENDER_FACTOR')
artistic = os.environ.get('COLORIZE_ARTISTIC')

if source_image is None:
    print("No source image provided")
    exit(1)

if target_path is None:
    print("No target path provided")
    exit(1)

artistic = (artistic == '1')

if render_factor is None:
    render_factor = 28 if artistic else 20
else:
    render_factor = int(render_factor)

###############################################################################

import torch
from deoldify.visualize import *

os.environ['CUDA_VISIBLE_DEVICES'] = '0'

torch.backends.cudnn.benchmark = True

colorizer = get_image_colorizer(
    artistic=artistic,
    render_factor=render_factor,
    results_dir=target_path
)

colorizer.plot_transformed_image(
    path=source_image,
    figsize=(20, 20),
    render_factor=render_factor,
    display_render_factor=True,
    compare=False,
    watermarked=False
)
