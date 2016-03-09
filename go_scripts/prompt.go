package main

import (
	"fmt"
	"os"
	"os/exec"
	"regexp"
	"strings"
)

func main() {
	printSegment(currTime(), "7")
	virtualEnv := os.Getenv("VIRTUAL_ENV")
	if strings.TrimSpace(virtualEnv) != "" {
		printSegment("(" + basename(virtualEnv) + ")", "7")
	}
	printSegment(currDir(), "7")
	if isGitRepo() {
		if isGitRepoBeingInitialized() {
			printSegment("initializing")
		} else {
			printSegment(gitBranch())
			printSegment(cleanMsg())
		}
	}
	fmt.Print("\n$ ")
}

func currDir() string {
	return "\\w"
}
func currTime() string {
	return "\\@"
}

func isGitRepoBeingInitialized() bool {
	_, err := exec.Command("git", "rev-parse", "HEAD").Output()
	return err != nil
}

func gitBranch() string {
	return system("git", "rev-parse", "--abbrev-ref", "HEAD")
}

func cleanMsg() string {
	if isClean() {
		return "Clean"
	} else {
		return "Unclean"
	}
}

func system(cmd string, args ...string) string {
	output, err := exec.Command(cmd, args...).Output()
	if err != nil {
		fmt.Println(os.Stderr, err)
		os.Exit(1)
	}
	return strings.TrimSpace(string(output))
}

func isClean() bool {
	matched, err := regexp.MatchString("nothing to commit", system("git", "status"))
	if err != nil {
		return false
	}
	return matched
}

func isGitRepo() bool {
	_, err := os.Stat("./.git/")
	if err == nil {
		return true
	}
	if os.IsNotExist(err) {
		return false
	}
	return true
}

func printSegment(text string, color ...string) {
	bgColor := os.Getenv("PROMPT_BG_COLOR")
	textColor := os.Getenv("PROMPT_TEXT_COLOR")
	if len(color) == 1 {
		textColor = color[0]
	}
	fmt.Print("\x1b[4" + bgColor + ";3" + textColor + "m " + text + " \x1b[00m ")
}

func basename(path string) string {
	return system("basename", path)
}
