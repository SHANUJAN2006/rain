<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the larger the image is, the longer it will take to show up in the datasheet.
-->

## How it works

This project is a Rain Prediction and Alert System designed for farmers. It reads environmental inputs—including 4-bit humidity (`ui_in[3:0]`), low atmospheric pressure (`ui_in[4]`), a raindrop sensor (`ui_in[5]`), and a dark cloud light sensor (`ui_in[6]`). When humidity is high and either low pressure or dark clouds are detected, it triggers a rain warning (`uo_out[0]`). If rain droplets are detected or severe storm conditions occur, it triggers a heavy rain alarm (`uo_out[1]`).

## How to test

Apply test vectors to `ui_in`:
- Set `ui_in = 5` (low humidity, clear weather) and verify `uo_out` is `0`.
- Set `ui_in = 27` (humidity = 11, low pressure = 1) and verify `uo_out[0]` (rain warning) becomes `1`.
- Set `ui_in = 32` (raindrop sensor = 1) and verify `uo_out[1]` (heavy rain alarm) becomes `1`.

## External hardware

- 4-bit ADC or digital humidity sensor connected to `ui_in[3:0]`
- Barometric pressure threshold sensor connected to `ui_in[4]`
- Raindrop detection module connected to `ui_in[5]`
- LDR / ambient light sensor module connected to `ui_in[6]`
- Yellow LED on `uo_out[0]` and Red LED / Buzzer on `uo_out[1]`
