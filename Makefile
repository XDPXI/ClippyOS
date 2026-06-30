all:
	nasm -f bin boot.asm -o boot.bin
	mkdir -p iso
	cp boot.bin iso/
	xorriso -as mkisofs -R -J -b boot.bin -no-emul-boot -o clippyos.iso iso/
	rm -rf boot.bin iso

clean:
	rm -rf boot.bin clippyos.iso iso

run:
	qemu-system-x86_64 -cdrom clippyos.iso
