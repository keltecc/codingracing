# *** coding: utf8 ***

from PIL import Image, ImageDraw, ImageFont
import os

import CodingRacing.local_settings as local_settings


def prepare_code(code):
    lines = code.split('\n')
    new_lines = []
    for i, line in enumerate(lines):
        new_lines.append('%3d  %s' % (i + 1, line))
    return '\n'.join(new_lines)


def generate(code, **kwargs):
    code = prepare_code(code)

    width, height = kwargs.get('width', 600), kwargs.get('height', 400)
    font_size = kwargs.get('font_size', 35)
    line_height = int(font_size * 1.2)
    left_padding = kwargs.get('left_padding', 10)

    background_color = (255, 255, 255)
    text_color = (0, 0, 0)

    image = Image.new('RGBA', (3 * width, 3 * height), background_color)
    draw = ImageDraw.Draw(image)
    draw.rectangle([0, 0, 100, 3 * height], '#eee', '#eee')
    font = ImageFont.truetype(os.path.join(local_settings.PROJECT_DIR, 'fonts/DejaVuSansMono.ttf'), font_size)

    lines = code.split('\n')
    for line_idx, line in enumerate(lines):
        draw.text((left_padding, line_height * line_idx), line, text_color, font=font)

    resized_image = image.resize((width, height), Image.ANTIALIAS)
    return resized_image

if __name__ == '__main__':
    code = '''using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
 
namespace check1
{
    class Program
    {
        static void Main(string[] args)
        {
            int i;
            Console.Write("Enter a Number : ");
            i = int.Parse(Console.ReadLine());
            if (i % 2 == 0)
            {
                Console.Write("Entered Number is an Even Number");
                Console.Read();
            }
            else
            {
                Console.Write("Entered Number is an Odd Number");
                Console.Read();
            }
        }
    }
}'''

    generate(code).save('code.png')
