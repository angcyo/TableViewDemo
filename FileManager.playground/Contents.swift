// : Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let nsFileM = NSFileManager.defaultManager()

let nsFileM3 = NSFileManager.defaultManager()

nsFileM == nsFileM3

let nsFileM2 = NSFileManager()
let nsFileM4 = NSFileManager()

nsFileM2 == nsFileM4

nsFileM == nsFileM2

nsFileM.displayNameAtPath("/asdf/asdfasdf/asdgasdg.name/")
try? nsFileM.attributesOfFileSystemForPath("/")

let fManager = nsFileM

fManager.URLsForDirectory(.AllApplicationsDirectory, inDomains: .UserDomainMask)
fManager.URLsForDirectory(.AllApplicationsDirectory, inDomains: .AllDomainsMask)

fManager.URLsForDirectory(.DocumentationDirectory, inDomains: .UserDomainMask)
fManager.URLsForDirectory(.DocumentationDirectory, inDomains: .LocalDomainMask)
fManager.URLsForDirectory(.DocumentationDirectory, inDomains: .NetworkDomainMask)
fManager.URLsForDirectory(.DocumentationDirectory, inDomains: .SystemDomainMask)

fManager.URLsForDirectory(.DocumentationDirectory, inDomains: .AllDomainsMask)

fManager.URLsForDirectory(.DownloadsDirectory, inDomains: .AllDomainsMask)

fManager.URLsForDirectory(.ItemReplacementDirectory, inDomains: .AllDomainsMask)
fManager.URLsForDirectory(.CachesDirectory, inDomains: .AllDomainsMask)

let docDirectory = fManager.URLsForDirectory(.DocumentationDirectory, inDomains: .UserDomainMask).first!

let ArchiveURL = docDirectory.URLByAppendingPathComponent("datas")

ArchiveURL.path
ArchiveURL.absoluteString
ArchiveURL.absoluteURL
ArchiveURL.baseURL
ArchiveURL.filePathURL

fManager.URLsForDirectory(.LibraryDirectory, inDomains: .AllDomainsMask)

fManager.URLsForDirectory(.AllLibrariesDirectory, inDomains: .AllDomainsMask)

