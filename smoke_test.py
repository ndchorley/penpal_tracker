import subprocess
import unittest


class SmokeTest(unittest.TestCase):
    def test_it_displays_version_information(self):
        completed_process = subprocess.run(
            args=["_build/default/bin/main.exe", "--version"],
            capture_output=True,
            text=True
        )

        self.assertEqual(
            completed_process.stdout,
            "penpal_tracker: some-commit-hash-here\n"
        )


unittest.main()
