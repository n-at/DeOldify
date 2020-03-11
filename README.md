**Build Docker image to run DeOldify as commandline tool**

[nvidia-docker](https://github.com/NVIDIA/nvidia-docker) required.

Build docker image:

    docker image build -t deoldify .
    
Run container:

    docker run --rm --gpus all --ipc=host \
        -v "/opt/deoldify/gray:/deoldify_source_images" \
        -v "/opt/deoldify/color:/deoldify_target_images" \
        -e COLORIZE_SOURCE_IMAGE="/deoldify_source_images/image.jpg" \
        -e COLORIZE_TARGET_PATH="/deoldify_target_images" \
        -e COLORIZE_RENDER_FACTOR="35" \
        -e COLORIZE_ARTISTIC="0" \
        deoldify

Batch:

    DIR="/opt/deoldify"
    COLOR_IMAGES="${DIR}/color"
    GRAY_IMAGES="${DIR}/gray"

    for image in $(ls -1 "${GRAY_IMAGES}"); do
        echo "processing ${image}"
        docker run --rm --gpus all --ipc=host \
            -v "${GRAY_IMAGES}:/deoldify_source" \
            -v "${COLOR_IMAGES}:/deoldify_target" \
            -e COLORIZE_SOURCE_IMAGE="/deoldify_source/${image}" \
            -e COLORIZE_TARGET_PATH="/deoldify_target" \
            -e COLORIZE_ARTISTIC="1" \
            deoldify 
    done

