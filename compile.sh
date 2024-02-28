# llama-2
# MODEL_NAME=Llama-2-13b-chat-hf
# QUANTIZATION=q4f16_0
# CONV_TEMP=llama-2
# CONTEXT_WINDOW_SIZE=768

# gemma
MODEL_NAME=gemma-2b-it
QUANTIZATION=q4f16_0
CONV_TEMP=gemma_instruction
CONTEXT_WINDOW_SIZE=768

# phi-2
# MODEL_NAME=phi-2
# QUANTIZATION=q4f16_1
# CONV_TEMP=phi-2
# CONTEXT_WINDOW_SIZE=768

# qwen
# MODEL_NAME=Qwen-1_8B-Chat
# QUANTIZATION=q4f16_0
# CONV_TEMP=chatml
# CONTEXT_WINDOW_SIZE=768

# convert weights
# mlc_chat convert_weight /home/chaoqin/model_resource/$MODEL_NAME/ --quantization $QUANTIZATION -o dist/$MODEL_NAME-$QUANTIZATION/

# create mlc-chat-config.json
# mlc_chat gen_config /home/chaoqin/model_resource/$MODEL_NAME/ --quantization $QUANTIZATION \
#   --conv-template $CONV_TEMP --context-window-size $CONTEXT_WINDOW_SIZE -o dist/${MODEL_NAME}-${QUANTIZATION}/

# # 2. compile: compile model library with specification in mlc-chat-config.json
# mlc_chat compile ./dist/${MODEL_NAME}-${QUANTIZATION}/mlc-chat-config.json \
#     --device android -o ./dist/${MODEL_NAME}-${QUANTIZATION}/${MODEL_NAME}-${QUANTIZATION}-android.tar

# mlc_chat compile ./dist/${MODEL_NAME}-${QUANTIZATION}/mlc-chat-config.json \
#     --device cuda -o ./dist/${MODEL_NAME}-${QUANTIZATION}/${MODEL_NAME}-${QUANTIZATION}-cuda.so

# Mistral
# MODEL_NAME=Mistral-7B-Instruct-v0.2
# QUANTIZATION=q4f16_0
# CONV_TEMP=mistral_default
# CONTEXT_WINDOW_SIZE=768

# mlc_chat convert_weight /home/chaoqin/model_resource/$MODEL_NAME/ --quantization $QUANTIZATION \
#     -o dist/$MODEL_NAME-$QUANTIZATION/
# # 1. gen_config: generate mlc-chat-config.json and process tokenizers
# mlc_chat gen_config /home/chaoqin/model_resource/$MODEL_NAME/ --quantization $QUANTIZATION \
#     --conv-template $CONV_TEMP --sliding-window-size 1024 --prefill-chunk-size 128 -o dist/${MODEL_NAME}-${QUANTIZATION}/
# # 2. compile: compile model library with specification in mlc-chat-config.json
# mlc_chat compile ./dist/${MODEL_NAME}-${QUANTIZATION}/mlc-chat-config.json \
#     --device android -o ./dist/${MODEL_NAME}-${QUANTIZATION}/${MODEL_NAME}-${QUANTIZATION}-android.tar