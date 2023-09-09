import os
import curses

# Set the directory to the current working directory
directory = os.getcwd()


def main(stdscr):
    stdscr.clear()

    # Prompt for the initial reference number
    stdscr.addstr("Enter the initial reference number: ")
    stdscr.refresh()
    ref_number = int(
        stdscr.getstr().decode()
    )  # getstr returns a bytes object, decode it to string

    # Sort the list of filenames
    filenames = sorted(os.listdir(directory))
    last_message = ""
    count = 0

    for filename in filenames:
        if filename.endswith(".webp") or filename.endswith(".png"):
            file_extension = os.path.splitext(filename)[1]
            while True:
                stdscr.clear()
                stdscr.addstr(last_message)
                stdscr.addstr(f"Current image: {filename}\n")
                stdscr.addstr(
                    "Press 'k' to increment the reference, 'u' for MN, 'i' for BK, 'o' for X, 'j' to skip, 'q' to quit\n"
                )
                stdscr.refresh()
                c = stdscr.getkey()

                if c == "k":
                    ref_number += 1
                    last_message = f"Reference number incremented to {ref_number}\n"
                    count = 0
                elif c in ["u", "i", "o"]:
                    new_name = (
                        f"M{ref_number:06}.MN{file_extension}"
                        if c == "u"
                        else f"M{ref_number:06}.BK{file_extension}"
                        if c == "i"
                        else f"M{ref_number:06}.X{file_extension}"
                        if count == 0
                        else f"M{ref_number:06}.Y{file_extension}"
                        if count == 1
                        else f"M{ref_number:06}.Z{file_extension}"
                    )
                    if c == "o":
                        count = count + 1
                    if os.path.exists(os.path.join(directory, new_name)):
                        last_message = "File already exists. Try again.\n"
                    else:
                        os.rename(
                            os.path.join(directory, filename),
                            os.path.join(directory, new_name),
                        )
                        last_message = f"Image renamed to {new_name}\n"
                        break
                elif c == "j":
                    last_message = "Skipping image.\n"
                    break
                elif c == "q":
                    last_message = "Quitting program.\n"
                    return


if __name__ == "__main__":
    curses.wrapper(main)
