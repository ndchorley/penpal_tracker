import os
import subprocess
import unittest


class SmokeTest(unittest.TestCase):
    def test_it_displays_version_information(self):
        expected_commit_hash = os.environ["BUILD_COMMIT_HASH"]

        completed_process = subprocess.run(
            args=["_build/default/bin/main.exe", "--version"],
            capture_output=True,
            text=True
        )

        self.assertEqual(
            completed_process.stdout,
            f"penpal_tracker: {expected_commit_hash}\n\n"
        )


unittest.main()
