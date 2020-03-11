Build docker image:

    docker image build -t deoldify .
    
Run container:

    docker run --rm --gpus all \
        -v "/opt/deoldify/gray:/deoldify_source_images" \
        -v "/opt/deoldify/color:/deoldify_target_images" \
        -e COLORIZE_SOURCE_IMAGE="/deoldify_source_images/image.jpg" \
        -e COLORIZE_TARGET_PATH="/deoldify_target_images" \
        -e COLORIZE_RENDER_FACTOR="35" \
        -e COLORIZE_ARTISTIC="0" \
        deoldify

