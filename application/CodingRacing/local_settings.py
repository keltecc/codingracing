# *** coding: utf8 ***

import os

LEVENSHTEIN_PENALTY = 5
DELAY_GAME_START = 5  # in seconds

COOKIE_HASH = 'aN07h3RR_super_s3cr3t_hash'

PROJECT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir)

MAX_USERS_IN_CONTEST = 4

MANAGERS = [os.environ.get('MANAGER', 'admin')]

